class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.901.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.901.0/snyk-macos"
    sha256 "3c3fafc5dbfd640b9b4521f6c70021c465d2edc9f6957e80b74e7b972dcb7948"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.901.0/snyk-linux"
    sha256 "da0df3ebbf12d87445ea87c0520ebc90a7f16916d6223d9216cb6a6150479897"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
