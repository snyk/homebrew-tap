class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.434.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.434.3/snyk-macos"
    sha256 "cdea1d0cdd3596f8280b29db72358c656dc49ccdd3f975e898231593e203937b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.434.3/snyk-linux"
    sha256 "034955f4a8f0839446c3a9a46327fc23e0477760e678fb92569635f1f08b52e3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
