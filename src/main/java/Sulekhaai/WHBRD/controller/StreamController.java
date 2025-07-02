// StreamController.java
package Sulekhaai.WHBRD.controller;

import Sulekhaai.WHBRD.Websocket.ImagePushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/api/stream")
public class StreamController {

    private static final String UPLOAD_DIR = "uploads/live";

    private final Map<String, byte[]> liveFrames = new ConcurrentHashMap<>();

    @Autowired
    private ImagePushService imagePushService;

    public StreamController() {
        new File(UPLOAD_DIR).mkdirs();
    }

    @PostMapping(value = "/receive", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> receiveFrame(
            @RequestPart("code") String cameraId,
            @RequestPart("image") MultipartFile imageFile) throws IOException {

        byte[] frame = StreamUtils.copyToByteArray(imageFile.getInputStream());
        liveFrames.put(cameraId, frame);

        // Save to disk (optional)
        File output = new File(UPLOAD_DIR, cameraId + "_latest.jpg");
        try (FileOutputStream fos = new FileOutputStream(output)) {
            fos.write(frame);
        }

        // Push to frontend
        String base64 = Base64.getEncoder().encodeToString(frame);
        imagePushService.push(cameraId, base64);

        return ResponseEntity.ok(Map.of(
                "success", true,
                "message", "Live frame received",
                "cameraId", cameraId
        ));
    }

    @GetMapping(value = "/preview", produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<byte[]> getLatestFrame(@RequestParam String cameraId) {
        byte[] frame = liveFrames.get(cameraId);
        return frame != null ?
                ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(frame) :
                ResponseEntity.notFound().build();
    }
}
