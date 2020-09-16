class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.398.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.398.0/snyk-macos"
    sha256 "6f983e5e4e7e29f147568ba9451aa8f046aabfd042afe1f575b9da1a5fc2dc0b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.398.0/snyk-linux"
    sha256 "3b076b58e8e0e7a4ceeb0f8ff8fb7a3748506af88ffd099a61d26c492c460296"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
