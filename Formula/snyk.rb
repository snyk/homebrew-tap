class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.596.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.596.0/snyk-macos"
    sha256 "777a8e6eba1db662643eae2e4ada6d2525abcd7d981e0619f0e1eba65168bf48"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.596.0/snyk-linux"
    sha256 "503803f1a13af691c6cfced38f3776adaca6600a60e499248715ba201490a236"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
