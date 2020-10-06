class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.409.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.409.1/snyk-macos"
    sha256 "e552277b224be54de7da0918cafdb860fac6268c8aca0a101b4c8870dcc83ded"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.409.1/snyk-linux"
    sha256 "7f4b9e269a3377cab9af43ce63b3cda0637f044ee146c6bb69cdef63e70c1960"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
