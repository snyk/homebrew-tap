class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.985.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.985.0/snyk-macos"
    sha256 "54e48b305ce798516e23deb799963d0f52d55de39154264b98bf044bab185d51"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.985.0/snyk-linux"
    sha256 "08a27630f0809b957ed2248b8915af6defd11507bb21c8243f8a794973bc9475"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
