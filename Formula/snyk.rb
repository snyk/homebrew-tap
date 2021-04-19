class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.551.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.551.0/snyk-macos"
    sha256 "369a86f765098f208f8d8324e23924451143134c4e09b255606cace34b351aee"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.551.0/snyk-linux"
    sha256 "37b8c4788e574b62e72a5817db86a7f8574928774b89ccbd32f1d29a864f593b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
