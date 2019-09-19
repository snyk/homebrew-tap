class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.228.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.228.2/snyk-macos"
    sha256 "1bb9ccfa027627bd12029b355a8bebebea4be58e77b18e480d943264c5d3dd06"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.228.2/snyk-linux"
    sha256 "1eb8fe323768bb34a4a5bff1ec332aebee19ed882983c06abcdd268edcde4c39"
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
