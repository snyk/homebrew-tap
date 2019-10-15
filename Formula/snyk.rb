class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.235.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.235.0/snyk-macos"
    sha256 "54219985e7205e484c0b8201e98ca3a689c7d551f525837e248150ecec12d4a6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.235.0/snyk-linux"
    sha256 "cccb8b06e9b0f26e6e4c266f0234efb941c84ef347a86fd80581248792121c8f"
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
