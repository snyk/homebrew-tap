class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.240.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.240.1/snyk-macos"
    sha256 "1c79ce6f1acbe442ac4a712b592f5bb14a74a054937695e3df7a9b40bcf39f3d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.240.1/snyk-linux"
    sha256 "ae7678a3e058a77b023c2e440191614c45091926d157885f8ed7dcc90a8aff89"
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
