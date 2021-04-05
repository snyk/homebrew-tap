class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.522.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.522.0/snyk-macos"
    sha256 "f636fc3ea49e62b06ed8bb63ee739e58353b0c7dc6aa2de40df6b170a3e59c35"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.522.0/snyk-linux"
    sha256 "a16e2c7fb3488b7388343de66b6d4af79b82aff2bfc1077e59ec4b3915bcd152"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
