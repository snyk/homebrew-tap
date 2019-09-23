class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.228.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.228.3/snyk-macos"
    sha256 "e8cca14f4b06110fd1d4dd03ee1b08c833c5f38051caa2df426e8b57c773f6f6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.228.3/snyk-linux"
    sha256 "44d80b16fed4de254673f75970c10824ba3c730d610cb0591798eeccf765ff3d"
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
