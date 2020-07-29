class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.369.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.369.0/snyk-macos"
    sha256 "2f337f756b0842cfe16c221d352f9100c07a423df5c5d7bf8b578f89de810a8f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.369.0/snyk-linux"
    sha256 "5e4ae1129ecd8233002c3b25e9c33d93794c513b2327aaf36a93bbeb22ea5973"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
