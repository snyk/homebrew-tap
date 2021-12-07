class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.785.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.785.0/snyk-macos"
    sha256 "89444fb65e7cb34db1d37d0d459fda392528e96653090a6403c8c33fdd84a4f1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.785.0/snyk-linux"
    sha256 "2c7e0bf69ed95c8f4fc49f453a1fdfbf855779eba1c94c2bf36371a389b749a3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
