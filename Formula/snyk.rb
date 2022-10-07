class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1024.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1024.0/snyk-macos"
    sha256 "8e1266a2786a75fdaf2f55763328bc1662440b06fd95a05f548dd3d0ac66cbdd"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1024.0/snyk-linux"
    sha256 "75cc960869b1afec0cd3283435ba3191124e612b3af061275785cd9ced3102b6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
