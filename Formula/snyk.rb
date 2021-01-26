class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.439.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.439.1/snyk-macos"
    sha256 "65cb50b382f2eb83ec179ae5a7cc2e43093c157f626ef4b845381ea1c1cec084"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.439.1/snyk-linux"
    sha256 "957bf49e04884820969bae471d1056422299ccbe1607201673b5422b2e327d1b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
