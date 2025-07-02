package Sulekhaai.WHBRD;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WhbrdApplication {

	public static void main(String[] args) {
		// Load .env.local for local development (ignore if missing)
		Dotenv dotenv = Dotenv.configure()
			.directory("./")
			.filename(".env.local")
			.ignoreIfMissing()
			.load();

		// Apply env variables if present
		setEnvIfPresent("DB_URL", dotenv.get("DB_URL"));
		setEnvIfPresent("DB_USER", dotenv.get("DB_USER"));
		setEnvIfPresent("DB_PASS", dotenv.get("DB_PASS"));
		setEnvIfPresent("JWT_SECRET", dotenv.get("JWT_SECRET"));
		setEnvIfPresent("EMAIL_USER", dotenv.get("EMAIL_USER"));
		setEnvIfPresent("EMAIL_PASS", dotenv.get("EMAIL_PASS"));

		SpringApplication.run(WhbrdApplication.class, args);
	}

	@SuppressWarnings("unused")
	private static void setEnvIfPresent(String key, String value) {
		if (value != null && !value.isEmpty()) {
			System.setProperty(key, value);
		}
	}
}
