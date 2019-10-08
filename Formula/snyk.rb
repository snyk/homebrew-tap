class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.232.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.232.0/snyk-macos"
    sha256 "b2cb3a9722ec62200cc39d6daeaaad1930615106c825c221af2f2f2b68ec812b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.232.0/snyk-linux"
    sha256 "db1f35c9fc9fefd015faf012b015e9425878c41e1aed94e367c99bc503635c13"
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
