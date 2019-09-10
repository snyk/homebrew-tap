class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.226.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.226.1/snyk-macos"
    sha256 "3216e7d75677d95b021e44aacef7aed481fdb8d175644f458f9f7ed637d9276b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.226.1/snyk-linux"
    sha256 "34d8de7a6312789eb72096a3b8373e3fd6bfbe8f2ab31ba283689a9e618683c0"
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
