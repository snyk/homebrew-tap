class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.997.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.997.0/snyk-macos"
    sha256 "c6a6814dceee68d341454788414f58405ba3f695f72dde940cf9c99c32d37378"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.997.0/snyk-linux"
    sha256 "52a45dc8d93fcc345f755e597c6f31b98f2648e5bdc899b6a5833d93482ad9ab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
