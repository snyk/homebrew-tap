class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.240.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.240.3/snyk-macos"
    sha256 "5bffa65a61f58422db379fa4c52f698e759b68230ca1e17958c4c76c010e4fa6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.240.3/snyk-linux"
    sha256 "0a8b30a552fd860461214c461d47fe3394c430be6e7bf2347ea0d98c01a55b11"
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
