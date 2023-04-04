class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1137.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1137.0/snyk-macos"
    sha256 "4434ea0e5f06e8fc200a00f6d9b0a251d4f21c19c98f845193edae9fc96c7eb5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1137.0/snyk-linux"
    sha256 "9824918884433c6197b3b1ac54cebb1c704370b7533e7fd751b7180a5ea402a2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
