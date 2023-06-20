class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1183.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1183.0/snyk-macos"
    sha256 "e155410be8887bfb8d9b19974f6366e0cc7d078ccf4a83e1d808e847afb28db1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1183.0/snyk-linux"
    sha256 "5030ae0130bfb3870619613af0c3dfcb28b64a4f9e281bbc34ca90a0d593dd0a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
