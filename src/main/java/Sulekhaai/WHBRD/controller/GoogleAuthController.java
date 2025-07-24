package Sulekhaai.WHBRD.controller;

import Sulekhaai.WHBRD.model.UserEntity;
import Sulekhaai.WHBRD.repository.UserRepository;
import Sulekhaai.WHBRD.util.JwtUtil;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = {
        "http://localhost:5173",
        "http://192.168.1.69:5173",
        "http://192.168.1.69",
        "https://sulekha-aii.netlify.app",
        "https://sulekha-w89v.onrender.com",
        "https://129f83ca5a55.ngrok-free.app ",  // ✅ Add your actual Ngrok URL here
})
public class GoogleAuthController {

    private static final Logger logger = LoggerFactory.getLogger(GoogleAuthController.class);

    @Autowired
    private GoogleIdTokenVerifier verifier;

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/google")
    public ResponseEntity<?> googleLogin(@RequestBody Map<String, String> body) {
        String idTokenString = body.get("token");

        if (idTokenString == null || idTokenString.trim().isEmpty()) {
            logger.warn("Token is missing in request");
            return ResponseEntity.badRequest().body(Map.of(
                    "success", false,
                    "message", "Token is missing"
            ));
        }

        try {
            GoogleIdToken idToken = verifier.verify(idTokenString);

            if (idToken == null || idToken.getPayload() == null) {
                logger.warn("Invalid or expired Google token");
                return ResponseEntity.status(401).body(Map.of(
                        "success", false,
                        "message", "Invalid or expired Google token"
                ));
            }

            GoogleIdToken.Payload payload = idToken.getPayload();
            String email = payload.getEmail();
            String name = Optional.ofNullable((String) payload.get("name")).orElse("User");

            UserEntity user = userRepo.findByEmail(email)
                    .orElseGet(() -> {
                        UserEntity newUser = new UserEntity();
                        newUser.setEmail(email);
                        newUser.setName(name);
                        newUser.setRole("ROLE_USER");
                        return userRepo.save(newUser);
                    });

            String jwt = jwtUtil.generateToken(user.getEmail(), user.getId(), user.getRole());

            return ResponseEntity.ok(Map.of(
                    "success", true,
                    "jwt", jwt,
                    "user", Map.of(
                            "id", user.getId(),
                            "email", user.getEmail(),
                            "name", user.getName(),
                            "role", user.getRole()
                    )
            ));

        } catch (Exception e) {
            logger.error("Google Auth error: {}", e.getMessage(), e);
            return ResponseEntity.status(500).body(Map.of(
                    "success", false,
                    "message", "Internal server error"
            ));
        }
    }
}
