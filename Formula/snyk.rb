class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.342.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.342.2/snyk-macos"
    sha256 "f847293df30e2fe9795356cd5f68e1df0e6077a248e3ea36afa3325d53a23ad4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.342.2/snyk-linux"
    sha256 "add8614fd63966770b8451a2a1bd7cc6d73d0e1c0faf3b367853dba5b8f600d8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
