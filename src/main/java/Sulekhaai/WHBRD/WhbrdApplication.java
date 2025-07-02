package Sulekhaai.WHBRD;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WhbrdApplication {

	public static void main(String[] args) {
		// Load .env file (helpful for local development)
		Dotenv dotenv = Dotenv.configure()
			.directory("./")
			.filename(".env")
			.ignoreIfMissing()
			.load();

		// Set required environment variables if defined in .env
		setEnvIfPresent("DB_URL", dotenv.get("DB_URL"));
		setEnvIfPresent("DB_USER", dotenv.get("DB_USER"));
		setEnvIfPresent("DB_PASS", dotenv.get("DB_PASS"));
		setEnvIfPresent("JWT_SECRET", dotenv.get("JWT_SECRET"));
		setEnvIfPresent("EMAIL_USER", dotenv.get("EMAIL_USER"));
		setEnvIfPresent("EMAIL_PASS", dotenv.get("EMAIL_PASS"));

		SpringApplication.run(WhbrdApplication.class, args);
	}

	private static void setEnvIfPresent(String key, String value) {
		if (value != null && !value.isEmpty()) {
			System.setProperty(key, value);
		}
	}
}
