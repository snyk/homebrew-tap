class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.413.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.413.2/snyk-macos"
    sha256 "8bd98381086adf1df19d06422e3e0b7ac955a7735acf64d25b7da5dc45bad3ce"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.413.2/snyk-linux"
    sha256 "abd5783f538bcf8035f75bb69ea55a0af5a5443d76546fd8ac6383cf51efeca4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
