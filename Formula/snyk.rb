class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.251.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.251.0/snyk-macos"
    sha256 "4ba6dbe0ab809ece1ae14994eeb2a4e9b5b0279c692c6b6d826c6e577517ed04"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.251.0/snyk-linux"
    sha256 "6362a1674833e356ac29e478d11fffc2de0ac73068bd25580cdc5268206491c0"
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
