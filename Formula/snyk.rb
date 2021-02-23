class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.459.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.459.0/snyk-macos"
    sha256 "dc7e3de7bed1ffcec64b9b07bb8c38e0d5a0c37919e0cb4a5066765216bd3fb3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.459.0/snyk-linux"
    sha256 "30973da307259c41770f2f2b89ab55b1fa186d759f2d0fd4b4111a3527e5e51e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
