class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.684.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.684.0/snyk-macos"
    sha256 "c831cc0a8ce6109e24cabd8cfe4bc257b45a0aafa1302587f1d164b270edae08"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.684.0/snyk-linux"
    sha256 "bdf6446bfaed1ae551b6eca14e8e101a53d855d33622094495e68e9a0b0069fc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
