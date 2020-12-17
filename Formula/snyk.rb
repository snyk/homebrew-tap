class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.437.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.437.2/snyk-macos"
    sha256 "d40999ba7f58d9dad827853c54f4439c8546b0951733d7d14ee55b9e5efc390f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.437.2/snyk-linux"
    sha256 "3d35a50cfd79507924cf1ae1d0bb4811d4195a0825713307eb2d0640f98fa7d5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
