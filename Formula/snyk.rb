class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.434.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.434.2/snyk-macos"
    sha256 "b64d1dd2873c5703f31a389a963056d24254cdbf600df88a3a2764358522b138"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.434.2/snyk-linux"
    sha256 "f6ab84ad87b01956e0b07031bb122f116c652f41900921be13c5e7664b1302c1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
