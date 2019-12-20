class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.264.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.264.0/snyk-macos"
    sha256 "ce8afcb289b377538f2c913e511a99ebb0aec1cf1c38a21a9ae033566d0e8621"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.264.0/snyk-linux"
    sha256 "e8c8202206728dc021c8970a701df323871b6b504f23e3349b661e2bc4234209"
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
