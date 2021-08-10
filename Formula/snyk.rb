class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.677.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.677.0/snyk-macos"
    sha256 "80756c51b93dad8e236338ddf561a0ba076a95a7d29415cfd1f1812ea2beac64"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.677.0/snyk-linux"
    sha256 "9ddbc8350584aea5eda8ef24dcd1cce61a4256a6811714b5cadf290dd9fa0f2e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
