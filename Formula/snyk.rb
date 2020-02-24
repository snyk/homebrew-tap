class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.296.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.296.0/snyk-macos"
    sha256 "7515d4acb7154f2255260f225a1016529b10ca4345cc54e0cdef66b917cca71e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.296.0/snyk-linux"
    sha256 "48b2251fdfbb4bc19408acaca16d120f62a8de33dc2e11803c5cef449373b9f3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
