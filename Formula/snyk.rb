class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.549.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.549.0/snyk-macos"
    sha256 "38a32b2b35967b3494d5e010b048eb174d343c6f7fc477b3af8aa764934af79b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.549.0/snyk-linux"
    sha256 "274feee21edb8a1fe0ee90f8fb4c8030014d995fa179c23468d820d85c4f44cf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
