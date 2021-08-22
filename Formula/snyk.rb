class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.684.1"

  if OS.mac?
    url "https://static.snyk.io/cli/dev/v1.684.1/snyk-macos"
    sha256 "8b0f8e36b88f902f18355cf3393f32d34c191fe68a76de645b3509ee3b31433d"
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
