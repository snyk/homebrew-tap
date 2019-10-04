class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.230.5"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.230.5/snyk-macos"
    sha256 "3a7d255ae9e811120d678a0c5330270a13db20f9f6c9ad66f40c11986d4262a0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.230.5/snyk-linux"
    sha256 "7708349a290458e5a0ffb170bb523157afbd519c0d63316651bbd68b10ab9304"
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
