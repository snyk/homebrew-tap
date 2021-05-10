class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.590.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.590.0/snyk-macos"
    sha256 "2d9a96c86d9b0f9678c6a744f49c977e3000f7cde4c52e75e28a42aaf21fc483"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.590.0/snyk-linux"
    sha256 "b19c3f23407af78e8f529e8bc5b0d2f06ffdec502524624eed2551ccf9abb6da"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
