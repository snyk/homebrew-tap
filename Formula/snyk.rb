class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.456.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.456.0/snyk-macos"
    sha256 "bf6872738626eee4337cb60460df98e6dade596c964ee1ec3070f5e4e33d9832"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.456.0/snyk-linux"
    sha256 "0becf99478c0c52bafb66a4016c7a455b60d6c1a0df5c3c3ec47df34511b7088"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
