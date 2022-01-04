class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.814.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.814.0/snyk-macos"
    sha256 "bdfde42b9c3ef258c01be48d92d0f5dcda2a104e9fc0ef8a4498c6285324cdae"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.814.0/snyk-linux"
    sha256 "f732ca88f53d74ed83c8cf2d6d12ceb7519a8ffa2ef680341d7c68ddf3b5f6ff"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
