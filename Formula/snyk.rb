class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.485.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.485.0/snyk-macos"
    sha256 "689b22dcfb2402da1014985f44c8c9fef49c9fe0c129c8e0dc7c45bcbce96bc7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.485.0/snyk-linux"
    sha256 "4f013e26aaa91f5bd4018b956e37f7de4d7c12a9d9351ed9f264cf1fa7f88a95"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
