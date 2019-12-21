class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.265.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.265.0/snyk-macos"
    sha256 "aee728d5f6fb253f7f46f9bc4c1f5548230b3ad105c3342b3dcae9b0b0a222b3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.265.0/snyk-linux"
    sha256 "91fdbb965e1c0f5e734c94e50568e3daa28f43dca48f31d0f3130f5df5a8f050"
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
