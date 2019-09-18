class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.228.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.228.0/snyk-macos"
    sha256 "30f8ec2fa2242da1b7eafad6c9d42385def4dae313226670671868075682d122"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.228.0/snyk-linux"
    sha256 "e340f8e1d72b4c51ce77d1357e062278b8c153641145ec058d9e24542dd128af"
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
