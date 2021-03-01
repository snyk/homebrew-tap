class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.462.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.462.0/snyk-macos"
    sha256 "b6fe6952e068944e71e163e0a3ae3bde2fa888284021d11dc2eaf68dc0590992"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.462.0/snyk-linux"
    sha256 "d1fa22b8eecb0c09c750436a3291b22de42a434f171e4ebbde9aee7c17a66a55"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
