class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.266.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.266.0/snyk-macos"
    sha256 "4a70da5fceb12a0fa4d4ad9e0d32e73921f7140c93bb1dd4417c31d0ac98e9ec"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.266.0/snyk-linux"
    sha256 "99641ac7e537dede4d15a989005bca82879f4991508d2d50af4f606c4a500b4d"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
