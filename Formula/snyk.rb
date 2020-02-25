class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.296.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.296.1/snyk-macos"
    sha256 "8d0ff89bfb694da237c778af6162e8a1107b212d7200b4d7dd83b4502436d1aa"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.296.1/snyk-linux"
    sha256 "6bf14e3815ef96a79f958b87d6076edd130c5a17075b321c85b1e44e40753c9e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
