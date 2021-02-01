class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.440.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.440.3/snyk-macos"
    sha256 "4f20b1217ad02bc1d4afae399175e1b4312e6d52943f354f4089c8fa68c7d70e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.440.3/snyk-linux"
    sha256 "16ffa447e42f08b49b29869d5fa9e8a8b087341d13de68e4d78c98dcfab403c5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
