class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.476.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.476.0/snyk-macos"
    sha256 "72245611723bddbb06d2ffc6232f7ff98aff48a31452b6483e3f504bfb54ebcc"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.476.0/snyk-linux"
    sha256 "2d1e0efcb1b369064b62519a185560769591fe1fe0cafe44d3e966398453d66f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
