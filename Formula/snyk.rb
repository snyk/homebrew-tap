class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.503.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.503.0/snyk-macos"
    sha256 "eca1e83333cca945c152fd1e35decf5243dab80fee9e5af9b670afb004bd064a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.503.0/snyk-linux"
    sha256 "dc97d35a88d26bfc3f916c88fcb285525ca0c1d015471522e29f9a6d3f2a5a4a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
