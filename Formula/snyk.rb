class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.263.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.263.0/snyk-macos"
    sha256 "f95b8af24e3febe63140d73ac4f2106ff09ff9c1e2b897fd2b6aed3bd51a9cec"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.263.0/snyk-linux"
    sha256 "0417708330a98ad322e892361657b352712d9122122f90f7a848575979f301aa"
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
