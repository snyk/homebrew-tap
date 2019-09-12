class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.226.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.226.2/snyk-macos"
    sha256 "908ca5f027dc816996e81a263f8df414c7a3635f742f24f334cd8f81b3279d24"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.226.2/snyk-linux"
    sha256 "13237bdd6f203c7416df8e8fbbebaf58835bb43348a4b7a90188e50c81abf486"
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
