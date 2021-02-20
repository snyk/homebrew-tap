class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.458.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.458.0/snyk-macos"
    sha256 "dad94a65b76aed6af0b0255b9d67bb01ec52e105cefd2e03d7a50b3542f0c362"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.458.0/snyk-linux"
    sha256 "1e154c5e8bde53d7439a601e4675ad834e7fce509defe20d1f17e1c1b4774872"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
