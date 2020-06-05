class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.336.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.336.0/snyk-macos"
    sha256 "3b809c4c24cf0c56d29db441ad7d7410cdb783a7aa59a49bbbbbdc8c03072acc"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.336.0/snyk-linux"
    sha256 "f7d193860d01f22178a6fabbeb8cee2de2ff7b6e45e09a56a2fb9912874c42ec"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
