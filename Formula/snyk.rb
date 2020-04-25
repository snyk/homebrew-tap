class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.311.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.311.0/snyk-macos"
    sha256 "b05ccc0569f7eb9a5576bc65d9b70d1eccc96eb0dddfc99c0bf70e3698048a3c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.311.0/snyk-linux"
    sha256 "ec4398d50486dcb57fa3565c424ed35024b0b9eb541b74c0b747dd014e2588d8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
